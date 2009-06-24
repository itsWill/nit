# This file is part of NIT ( http://www.nitlanguage.org ).
#
# Copyright 2004-2008 Jean Privat <jean@pryen.org>
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

import end

interface Object
end

universal Int
	meth output is intern
	meth +(o: Int): Int is intern
end

universal Bool
	meth output is intern
end

class Integer
	readable writable attr _val: Int
	init(val: Int) do _val = val
	meth output do _val.output
end

class Foo
	attr _a1: Integer
	readable attr _a2: Integer
	meth run
	do
		_a1.output
		a2.output
	end

	meth show(i: Int)
	do
		i.output
		(isset _a1).output
		(isset _a2).output
	end

	init
	do
		show(1)
		_a1 = new Integer(1)
		show(2)
		_a2 = new Integer(_a1.val + 1)
		show(3)
	end

	init nop do end
end

class Bar
special Foo
	attr _a3: Integer#!alt1# #!alt2#
	#alt1#attr _a3: Integer = new Integer(9000)
	#alt2#attr _a3: nullable Integer
	redef meth run
	do
		_a1.output
		_a2.output
		_a3.output
	end

	redef meth show(i)
	do
		super
		(isset _a3).output
	end

	init
	do
		nop
		show(4)
		_a1 = new Integer(10)
		show(5)
		_a2 = new Integer(20)
		show(6)
		_a3 = new Integer(30)
		show(7)
	end
end

var f = new Foo
var b = new Bar
f.run
b.run
