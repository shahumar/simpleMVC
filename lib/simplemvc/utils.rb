class String
	def to_snake_case
		self.gsub("::", "/").
			gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2').
			gsub(/([a-z\d])([A-Z])/, '\1_\2').
			tr("-", "_").downcase
	end

	def to_camel_case
		#my_pagesController
		return self if self !~ /_/ && /[A-Z]+.*/
		self.split('_').map{|c| c.capitalize}.join("")
	end
end
