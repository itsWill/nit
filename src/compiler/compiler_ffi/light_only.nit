# This file is part of NIT ( http://www.nitlanguage.org ).
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

# Compiler support for the light FFI only, detects unsupported usage of callbacks
module light_only

import light

redef class MClassType
	redef fun cname_normal_class do return "void*"
end

redef class AMethPropdef
	redef fun accept_externmeth do return n_extern_calls == null
end
