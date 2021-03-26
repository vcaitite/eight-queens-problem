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
    newExecFileName=str(n)+"Execution.R"
    newFitnessFileName=str(n)+"fitness_function.R"
    newNValue = "n = "+str(n)
    with open(os.path.join("..", "Execution.R"), "r") as executionFile:
        execution = executionFile.readlines()
    with open(os.path.join("..", "fitness_function.R"), "r") as fitnessFile:
        fitness = fitnessFile.readlines()
    with open(newExecFileName, "w") as newExecFile:
        for line in execution:
            line = line.replace("n = 15", newNValue)
            newExecFile.write(line)
    with open(newFitnessFileName, "w") as newFitnessFile:
        for line in fitness:
            line = line.replace("n = 15", newNValue)
            newFitnessFile.write(line)
    return newExecFileName, newFitnessFileName

def get_time(rawResult):
    runtimeString = "Runtime:: "
    extraInfoString = "sec elapsed"
    runtimeLocation = rawResult.find(runtimeString)
    runtimeAsString = rawResult[runtimeLocation+len(runtimeString):]
    extraInfoLocation = runtimeAsString.find(extraInfoString)
    runtimeAsString = runtimeAsString[:extraInfoLocation]
    return float(runtimeAsString)

def run():
    stats=[]
    try:
        for i in range(8,14):
            print(f"Running for n={i}")
            queensFile = replace_n(i)
            fitness_string = f"source(\"{i}fitness_function.R\")\n"
            exec_string = f"source(\"{i}Execution.R\")\n"
            stat_string = fitness_string + exec_string
            stat_string = stat_string.encode("utf-8")
            run_cmd = ["R --no-save"]
            timeResult = []
            for j in range(50):
                try:
                    rawResult = subprocess.run(run_cmd, input=stat_string, stdout=subprocess.PIPE, stderr=subprocess.PIPE, check=True, shell=True)
                except subprocess.CalledProcessError as CPE:
                    print(CPE.stderr.decode("utf-8"))
                    exit(1)
                timeResult.append(get_time(str(rawResult.stdout.decode("utf-8"))))
            print(f"Finished for n={i}")
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



