#
# Author:: Christopher Peplin (<peplin@bueda.com>)
# Copyright:: Copyright (c) 2010 Christopher Peplin
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

pipRoot = ::File.expand_path(::File.join(::File.dirname(__FILE__), ".."))
require pipRoot + '/providers/pip'

require 'chef/resource/package'

class Chef
  class Resource
    class PipPackage < ::Chef::Resource::EasyInstallPackage

      def initialize(name, run_context=nil)
        super
        @resource_name = :pip_package
        @provider = Chef::Provider::Package::Pip
      end

      def pip_binary(arg=nil)
        set_or_return(
          :pip_binary,
          arg,
          :kind_of => [ String ]
        )
      end

      def virtualenv(arg=nil)
        set_or_return(
          :virtualenv,
          arg,
          :kind_of => [ String ]
        )
      end

      def file(arg=nil)
        set_or_return(
          :file,
          arg,
          :kind_of => [ String ]
        )
      end

      def scm(arg=nil)
        set_or_return(
          :scm,
          arg,
          :kind_of => [ String ]
        )
      end

    end
  end
end
