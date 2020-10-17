class SuperClass
	def public_meth
		puts "this is public method"
	end
	private
	def private_meth
		puts "this is private method"
	end
	protected
	def protected_meth
		puts "this is protected method"
	public
	end
	def self.public_meth
		puts "this is public CLASS method"
	end
	private
	def self.private_meth
		puts "this is private CLASS method"
	end
	protected
	def self.protected_meth
		puts "this is protected CLASS method"
	end
end
class SubClass < SuperClass
	def sub_pub
		public_meth
	end
	def sub_priv
		private_meth
	end
	def sub_protec
		protected_meth
	end
	def self.sub_cl_pub
		public_meth
	end
	def self.sub_cl_priv
		private_meth
	end
	def self.sub_cl_protec
		protected_meth
	end
end

a = SuperClass.new
b = SubClass.new

puts "a"
a.public_meth
#a.private_meth
#a.protected_meth

puts "SuperClass"
SuperClass.public_meth
SuperClass.private_meth
SuperClass.protected_meth

puts "b"
b.public_meth
#b.private_meth
#b.protected_meth

b.sub_pub
b.sub_priv
b.sub_protec

puts "SubClass"
SubClass.sub_cl_pub
SubClass.sub_cl_priv
SubClass.sub_cl_protec
