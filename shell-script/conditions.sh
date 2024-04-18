#!/bin/bash

# num1=$1
# num2=$2

# if (( ($num1 > $num2 | bc -1) ))
# then
#  echo "$num1 is greater than $num2"
# else
#  echo "$num1 is less than $num2"
# fi

#!/bin/bash

num1=$1
num2=$2

# Use bc for floating-point comparison
if (( $(echo "$num1 > $num2" | bc -l) )); then
  echo "$num1 is greater than $num2"
else
  echo "$num1 is less than or equal to $num2"
fi
