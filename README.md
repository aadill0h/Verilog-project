.

Fuel Cell Inventory Management System (FCIMS)

Introduction:
As the demand for electric and hydrogen vehicles rises, the need for efficient and adaptable fuel cell management systems becomes increasingly apparent. Current charging and refueling methods suffer from inefficiencies such as space and time wastage, as well as a lack of portability in charging stations. To address these challenges, we propose the development of a Fuel Cell Inventory Management System (FCIMS) that streamlines the management of swappable fuel cells for both electric and hydrogen vehicles.

Problem Statement:
Create a system that can calculate the number of charged and empty fuel cells remaining in a fuel cell storing system while at the same time calculating the total price of the fuel cells brought or sold. We need to be able to select 4 functions to manipulate count variable, i.e., add to count, subtract from count, reset count to full, and clear count to 0. This can be done using a 2-bit operation code. Furthermore, if the fuel cell count is completely filled, we need a light to be turned on to signify the 
same, along with a separate indicator light to signal when the storage is empty.

Proposed Solution: (bits can be increased)
Inputs:
- Number of electric or hydrogen cells (4-bit)
- Price per cell (4-bit)
- Operation code (2-bit)
- Previous count (4-bit) (this is done to simulate memory)

Outputs:
- Current count (4-bit)
- FULL COUNT LED (1-bit)
- EMPTY COUNT LED (1-bit)
- Total price (8-bit)

The total price is calculated using a binary multiplier by multiplying the number of cells with the price.

Operations: the operation is decided using a 4:1 multiplexer.
1. ADD (01): Utilizing a 4-bit parallel full adder to increment the count, simulating the addition of fuel cells to the storage.
2. SUBTRACT (10): Employing a 4-bit subtractor to decrement the count, simulating the removal of fuel cells for use.
3. CLEAR (00): Adding the 2’s complement of the count to itself while discarding the carry to reset the count to zero.
4. RESET (11): Adding the 1’s complement of the count to itself to achieve a full count.

LED Indicators:
1. EMPTY COUNT LED: The LED activates when the count reaches zero (ie: 0000), indicating an empty inventory. Achieved by OR gating each bit and NOT gating the final output.
2. FULL COUNT LED: The LED illuminates when the count reaches maximum capacity (ie:1111), indicating a fully replenished inventory. Achieved by applying an AND gate to each bit.

Conclusion:
The proposed FCIMS offers a comprehensive solution for managing fuel cell inventories efficiently, addressing the challenges associated with current charging and refueling methods. By integrating versatile functionalities and intuitive indicators, FCIMS aims to enhance the usability and reliability of fuel cell management in the rapidly evolving landscape of electric and hydrogen vehicles.
