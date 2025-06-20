import subprocess
import os

GHDL = "C:/ghdl/bin/ghdl.exe"  
GTKWave = "C:/msys64/ucrt64/bin/gtkwave.exe"  

vhdl_sources = [
    "adder.vhd",
    "adder_tb.vhd"
]

top_entity = "adder_tb"
vcd_file = f"{top_entity}.vcd"

def compile_vhdl():
    for source in vhdl_sources:
        command = [GHDL, "-a", source]
        print(f"Compiling {source}...")
        subprocess.run(command, check=True)

def elaborate():
    command = [GHDL, "-e", "adder_tb"]
    print("Elaborating adder_tb...")
    subprocess.run(command, check=True)

def run_simulation():
    command = [GHDL, "-r", "adder_tb", "--vcd=" + vcd_file,"--stop-time=30ns"]
    print("Running simulation...")
    subprocess.run(command, check=True)

def generate_waveform():
    command = [GTKWave, vcd_file,]
    print("Generating waveform...")
    subprocess.run(command, check=True)


def main():
    if not os.path.exists(GHDL):
        print("GHDL executable not found. Please check the path.")
        return

    if not os.path.exists(GTKWave):
        print("GTKWave executable not found. Please check the path.")
        return

    compile_vhdl()
    elaborate()
    run_simulation()
    generate_waveform()


if __name__ == "__main__":
    main()