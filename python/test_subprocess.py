import sys
from subprocess import Popen, PIPE
p1 = Popen(['lsof', '-i:80', '-Fc'], stdout=PIPE)
p2 = Popen(["grep", '-Pi', 'c' + 'neutron-server'], stdin=p1.stdout, stdout=PIPE)
output = p2.communicate()[0]
print(output)
