import subprocess
import os
import numpy

def gen_perm_list(n=8):
    permList = []
    for i in range(n):
        permList.append(i+1)
    permListAsString = permList.__str__()
    return permListAsString

def replace_n(n=8):
    newFileName=str(n)+"Queen.pl"
    with open(os.path.join("..", "nQueens.pl"), "r") as nQueensFile:
        nQueens = nQueensFile.readlines()
    newPermList = gen_perm_list(n)
    with open(newFileName, "w") as newNQueensFile:
        for line in nQueens:
            line = line.replace("__permList__", newPermList)
            newNQueensFile.write(line)
    return newFileName

def get_time(rawResult):
    runtimeString = "Runtime = "
    runtimeLocation = rawResult.find(runtimeString)
    runtimeAsString = rawResult[runtimeLocation+len(runtimeString):]
    runtimeAsString = runtimeAsString.split(".")[0]
    return float(runtimeAsString)

def run():
    stat_string = b"statistics(runtime,[Start|_]), queenN(C), statistics(runtime,[Stop|_]), Runtime is Stop - Start, nl. halt."
    stats=[]
    try:
        for i in range(8,15):
            print(f"Running for n={i}\n\t", end="")
            queensFile = replace_n(i)
            run_cmd = ["swipl", queensFile]
            timeResult = []
            for j in range(10):
                print(f"{j}, ", end="", flush=True)
                rawResult = subprocess.run(run_cmd, input=stat_string, stdout=subprocess.PIPE, stderr=subprocess.PIPE, check=True)
                timeResult.append(get_time(str(rawResult.stdout)))
            print(f"\nFinished for n={i}")
            mean = numpy.mean(timeResult)
            stdev = numpy.std(timeResult)
            stats.append((i, mean, stdev))
    except KeyboardInterrupt:
        return stats
    return stats

def main():
    stats = run()
    for stat in stats:
        n, mean, stdev = stat
        print(f"Queens:{n}\n\tMean:{mean}\n\tSigma:{stdev}\n")

main()



