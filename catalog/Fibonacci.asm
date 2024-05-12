main:
    # Initialize
    li $t0, 0           # First Fibonacci number
    li $t1, 1           # Second Fibonacci number
    li $t2, 2           # Initialize loop counter, Fibonacci starts from index 2

    # Edge cases for 0 or 1
    blt $a0, $t2, edge_cases # Jump to handle 0 or 1 explicitly

loop:
    # Fibonacci calculation: F(n) = F(n-1) + F(n-2)
    add $v0, $t0, $t1   # $v0 = $t0 + $t1
    move $t0, $t1       # Move $t1 to $t0
    move $t1, $v0       # Store new Fibonacci in $t1 for next iteration

    # Increment loop counter and check if done
    addi $t2, $t2, 1    # Increment counter
    blt $t2, $a0, loop  # Continue looping until we've computed nth Fibonacci

    # Done calculating, ready to return
    b done              # Jump to finish

edge_cases:
    # Handle special cases where n is 0 or 1
    beq $a0, $zero, zero_case # If n is 0, result is 0
    li $v0, 1           # Otherwise n is 1, result is 1
    b done              # Jump to finish

zero_case:
    move $v0, $zero     # Set result to 0 for Fibonacci(0)

done:
    jr $ra              # Return from main function
