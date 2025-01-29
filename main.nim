import strutils
import std/strformat

proc add(a: float, b: float): float = a + b

proc sub(a: float, b: float): float = a - b

proc divi(a: float, b: float): float =
    if b == 0.0:
        raise newException(ValueError, "cannot divide by zero")
    result = a / b

proc mul(a: float, b: float): float = a * b


var one: float
var two: float
var choice: string
var choiceint: int
var res: float



echo "simple cli calculator"
while true:
    stdout.write("""enter options:
1. add
2. subtract
3. divide
4. multiply
q. quit
[1/2/3/4/q] > """)

    choice = readLine(stdin)

    if toLower(choice) == "q" or toLower(choice) == "quit":
        break
    
    try:
        if not (parseInt(choice) in 1..4):
            echo "please enter a valid choice\n"
            continue
    except ValueError:
        echo "please enter a valid choice\n"
        continue

    
    while true:
        try:
            stdout.write("enter first number: ")
            one = parseFloat(readLine(stdin))
            break
        except:
            echo "please enter a float or integer.\n"
            continue

    while true:
        try:
            stdout.write("enter second number: ")
            two = parseFloat(readLine(stdin))
            break
        except:
            echo "please enter a float or integer.\n"
            continue

    echo ""

    choiceint = parseInt(choice)

    case parseInt(choice):
        of 1:
            res = add(one, two)

        of 2:
            res = sub(one, two)
    
        of 3:
            try:
                res = divi(one, two)
            except:
                echo "result: undefined"
                echo ""
                continue
    
        of 4:
            res = mul(one, two)

        else:
            echo "invalid choice"
    
    echo "result: ", res
    
echo "program quit"
        