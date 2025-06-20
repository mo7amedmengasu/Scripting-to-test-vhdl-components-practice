import subprocess
import os


ghdl_path = "C:/ghdl/bin/ghdl.exe" 
gtkwave_path = "C:/msys64/ucrt64/bin/gtkwave.exe" 

vhdl_sources = [
    "mux4x1.vhd",
    "mux4x1_test.vhd"
]

top_entity = "mux4x1_test"
vcd_file = f"{top_entity}.vcd"

def compile_vhdl():
    for source in vhdl_sources:
        command = [ghdl_path, "-a", source]
        print(f"Compiling {source}...")
        subprocess.run(command, check=True)

def elaborate():
    command = [ghdl_path, "-e", top_entity]
    print(f"Elaborating {top_entity}...")
    subprocess.run(command, check=True)

def simulate():
    command = [ghdl_path, "-r", top_entity, "--vcd=" + vcd_file, "--stop-time=40ns" ]
    print(f"Simulating {top_entity}...")
    subprocess.run(command, check=True)

def view_waveform():
    command = [gtkwave_path, vcd_file]
    print(f"Opening waveform viewer for {vcd_file}...")
    subprocess.run(command, check=True)

def main():
    if not os.path.exists(ghdl_path):
        print("GHDL executable not found. Please check the path.")
        return

    if not os.path.exists(gtkwave_path):
        print("GTKWave executable not found. Please check the path.")
        return

    compile_vhdl()
    elaborate()
    simulate()
    view_waveform()

if __name__ == "__main__":
    main()

