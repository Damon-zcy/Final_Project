import numpy as numpy
import struct

def png2ram(input_file, output_file):
	with open(output_file,'wb') as out_file:
		with open(input_file,'r') as in_file:
			r = in_file.readlines()
			for i in range(0, len(r)//2):
				s1 = r[i*2][:-1]
				s2 = r[i*2+1][:-1]
				if (len(s1)==1): s1="0"+s1
				if (len(s2)==1): s2="0"+s2
				s = int(s2+s1,16)
				color_16 = struct.pack('H', s)
				out_file.write(color_16)
	print(s1+s2)

png2ram('zcy.txt','out.ram');