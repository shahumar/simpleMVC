require "simplemvc/version"
require "simplemvc/controller.rb"
require "simplemvc/utils.rb"
require "simplemvc/dependencies.rb"
require "simplemvc/router.rb"

module Simplemvc
	class Application
		def call(env)
			#env["PATH_INFO"] = "/pages/about"
			if env["PATH_INFO"] == "/favicon.ico"
				return [500, {}, []]
			end

			get_rack_app(env).call(env)
		end

		def get_controller_and_action(env)
			_, controller_name, action = env["PATH_INFO"].split("/")
			controller_name = controller_name.to_camel_case + "Controller"
			[Object.const_get(controller_name), action]
		end
	end
end
