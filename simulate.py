import os
import subprocess

# ------------------------
# Settings
# ------------------------
ghdl_path = "C:/ghdl/bin/ghdl.exe" # Path to GHDL executable
gtkwave_path = "C:/msys64/ucrt64/bin/gtkwave.exe"  # optional, if you want to open waveform
vhdl_file = "test.vhd"
top_entity = "testbench"
vcd_file = f"{top_entity}.vcd"

# # ------------------------
# # Step 1: Analyze
# # ------------------------
print("[1] Analyzing VHDL...")
subprocess.run([ghdl_path, "-a", vhdl_file], check=True)

# # ------------------------
# # Step 2: Elaborate
# # ------------------------
print("[2] Elaborating design...")
subprocess.run([ghdl_path, "-e", top_entity], check=True)

# # ------------------------
# # Step 3: Run Simulation
# # ------------------------
print("[3] Running simulation...")
subprocess.run([
    ghdl_path, "-r", top_entity,
    "--stop-time=100ns",
    f"--vcd={vcd_file}"
], check=True)

# # ------------------------
# # Step 4: Optional - Open GTKWave
# # ------------------------
if os.path.exists(gtkwave_path):
    print("[4] Opening GTKWave...")
    subprocess.run([gtkwave_path, vcd_file])
else:
    print("[4] GTKWave not found, skipping...")
