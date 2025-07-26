from passlib.hash import nthash

import sys

if len(sys.argv) != 3:
    print("Usage: python ConvertTo-NTLM.py <input.txt> <output.txt>")
    sys.exit(1)

input_file = sys.argv[1]
output_file = sys.argv[2]

with open(input_file, "r", encoding="utf-8") as infile, open(output_file, "w") as outfile:
    for line in infile:
        pw = line.strip()
        if pw:
            ntlm = nthash.hash(pw)
            outfile.write(ntlm + "\n")

print(f"✅ NTLM hashes saved to {output_file}")
