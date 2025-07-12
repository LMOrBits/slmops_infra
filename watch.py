#!/usr/bin/env python3
import subprocess, time
from rich.live import Live
from rich.table import Table
from rich.console import Console
from rich import box

def fetch_pods():
    out = subprocess.run(
        ["kubectl", "get", "pods", "--all-namespaces", "--no-headers"],
        stdout=subprocess.PIPE, stderr=subprocess.DEVNULL, text=True
    ).stdout.splitlines()
    return [line.split(None, 5) for line in out]

def make_table(pods):
    table = Table(box=box.MINIMAL)
    table.add_column("NAMESPACE", style="bold")
    table.add_column("POD")
    table.add_column("STATUS")
    table.add_column("RESTARTS", justify="right")
    table.add_column("AGE", justify="right")

    for ns, pod, *_ , status, restarts, age in pods:
        if status == "Running":
            col = "green"
        elif status == "Pending":
            col = "yellow"
        elif "CrashLoopBackOff" in status or "Error" in status:
            col = "red"
        else:
            col = "white"
        table.add_row(ns, pod, f"[{col}]{status}[/{col}]", restarts, age)
    return table

def main():
    console = Console()
    with Live(console=console, refresh_per_second=1):
        while True:
            pods = fetch_pods()
            console.clear()
            console.print(make_table(pods))
            time.sleep(1)

if __name__ == "__main__":
    main()