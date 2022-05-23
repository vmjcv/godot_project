import json, os
from .Exporter import Exporter

class GDScriptExporter(Exporter):
	def __init__(self, config):
		super(GDScriptExporter, self).__init__(config)
		self.name = "gdscript"

	def export_table(self, tabel):
		return tabel

	def detect_type(self, value):
		if isinstance(value, str):
			return "String"
		elif isinstance(value, int):
			return "int"
		elif isinstance(value, float):
			return "float"
		elif isinstance(value, bool):
			return "bool"
		elif isinstance(value, dict):
			return "Dictionary"
		elif isinstance(value, list):
			return "Array"
		else:
			return None

	def is_tool(self):
		return self.config["exporter"]["gdscript"]["tool"]

	def is_autoload(self):
		return self.config["exporter"]["gdscript"]["autoload"]

	def convert_value(self, value, valueType):
		if value is None:
			return "null"
		elif  valueType=="String":
			return '"' + value.replace('"', '\\"') + '"'
		elif valueType=="int" or valueType=="float" or valueType=="bool":
			return str(value)
		elif valueType=="Dictionary" or valueType=="Array":
			jsonStr=json.dumps(value, ensure_ascii=False, sort_keys=True)
			return jsonStr[1:-1]
		elif isinstance(value, str):
			return '"' + value.replace('"', '\\"') + '"'
		elif isinstance(value, dict) or isinstance(value, list):
			jsonStr=json.dumps(value, ensure_ascii=False, sort_keys=True)
			return jsonStr[1:-1]
		return str(value)

	def get_class_name(self, table_name):
		class_name = "{}{}{}".format(
			self.config["exporter"]["gdscript"]["type_prefix"],
			table_name,
			self.config["exporter"]["gdscript"]["type_extention"],
		)
		return class_name

	def dump_script(self, name, data):
		out_path = os.path.join(self.config['output'], self.name, name + '.gd')
		print("Sheet", name, "==>", out_path)
		if not os.path.isdir(os.path.dirname(out_path)): os.makedirs(os.path.dirname(out_path))
		class_name = self.get_class_name(name)
		script_text = self.line("# Tool generated file DO NOT MODIFY")
		if self.is_tool(): script_text += self.line("tool")
		script_text += self.line()
		script_text += self.line("class {}:".format(class_name))
		first_line = data[0]
		second_line = data[1]
		props = sorted(data[1].keys())
		idx = 0
		params = ""
		initializers = ""
		for key in props:
			# declear
			declear = self.line("var {}".format(key), 1)
			script_text += declear
			# parms
			param = "p_" + key
			if idx > 0: params += ", "
			params +=  param
			# initialize
			initializer = self.line("{} = {}".format(key, param), 2)
			initializers += initializer
			idx += 1
		constructor_func = self.line("func _init({}):".format(params), 1)
		script_text += constructor_func
		script_text += initializers

		script_text += self.line()
		script_text += self.line("static func load_configs():")
		script_text += self.line("return {", 1)
		for row in data[2:]:
			args = ""
			idx = 0
			for key in props:
				if idx > 0: args += ", "
				args += self.convert_value(row[key],first_line[key])
				idx += 1
			line = self.line("{}:{}.new({}),".format(row["id"],class_name, args), 2)
			script_text += line
		script_text += self.line("}", 1)
		file = open(out_path, 'w', encoding="utf8")
		file.write(script_text)

	def parse_tables(self, tables):
		for name in tables:
			self.tables[name] = self.export_table(tables[name])

	def dump(self):
		index_file_content = self.line("# Tool generated file DO NOT MODIFY")
		if self.is_tool(): index_file_content += self.line("tool")
		if self.is_autoload(): index_file_content += self.line("extends Node")
		index_file_content += self.line()
		scripts_consts = ""
		classes_consts = ""

		functions = self.line("func get_by_id(table_name: String, id:int):")
		functions += self.line("return configs.get(table_name,{}).get(id)", 1)
		functions += self.line()
		functions += self.line("func get_table(table_name: String):")
		functions += self.line("return configs.get(table_name,{})", 1)

		configs = self.line("var configs = {")
		configs_initializers = self.line("func _init():")
		for name in self.tables:
			self.dump_script(name, self.tables[name])
			script_const_name = name + "Script"
			scripts_consts += self.line('const {} = preload("{}.gd")'.format(script_const_name, name))
			configs += self.line('"{}": '.format(name)+"{},", 1)
			configs_initializers += self.line('configs["{}"] = {}.load_configs()'.format(name, script_const_name), 1)

		configs += self.line("}")

		index_file_content += scripts_consts
		index_file_content += self.line()
		index_file_content += configs
		index_file_content += self.line()
		index_file_content +=  functions
		index_file_content += self.line()
		index_file_content += configs_initializers
		# index_file_content += self.line()


		out_path = os.path.join(self.config['output'], self.name, self.config['exporter']['gdscript']['index_file'] + '.gd')
		if not os.path.isdir(os.path.dirname(out_path)): os.makedirs(os.path.dirname(out_path))
		file = open(out_path, 'w', encoding="utf8")
		file.write(index_file_content)