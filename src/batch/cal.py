
import math

for p3 in range(1, 10):
    for s3 in range(1, 10):
        for s0 in range(1, 10):
            for s5 in range(1, 10):

                exp1 = (p3 ^ (s3 * ((s0 - p3) - s5))) | 0x00000000
                tmp = int(s0/p3)
                exp2 = int(-4) | (p3 ^ (s3 * (-8^tmp - s5)))

                exp3 = ((exp1+s3) * 9 * 9 + 9) * (-7)
                exp4 = ((exp2+s3) *9 * 9 +9)*(-7)

                print(f"{p3} {s3} {s0} {s5} {exp3} {exp4} ")


