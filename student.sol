// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract MarksManagmtSys
{
	uint[] data; 
    uint k;
  
	struct Student
	{
		int ID;
		string fName;
		string lName;
		int marks;
	
	}
	
    event Log(string func, address sender, uint value);
	address owner;
	int public stdCount = 0;
	mapping(int => Student) public stdRecords;

	modifier onlyOwner
	{
		require(owner == msg.sender);
		_;
	}
	constructor()
	{
		owner=msg.sender;
	}

	function addNewRecords(int _ID,
						string memory _fName,
						string memory _lName,
						int _marks
						) public onlyOwner				
	{
	
		stdCount = stdCount + 1;
		stdRecords[stdCount] = Student(_ID, _fName,_lName,_marks);
	
	}
	function percentage(uint kValue) public returns(uint[] memory){
    	data.push(kValue);
    	return data;
    }
	
	function bonusMarks(int _bonus) public onlyOwner
	{
		stdRecords[stdCount].marks = stdRecords[stdCount].marks + _bonus;

	}
	fallback() external payable 
	{
		emit Log("fallback", msg.sender, msg.value);
	}
	receive() external payable 
	{
		emit Log("receive", msg.sender, msg.value);
	}
}


