// SPDX-License-Identifier:MIT

pragma solidity ^0.8.21;

contract TestWhatILearnt{
    struct Person{
        string Name;
        int256 MathsScore;
        int256 English;
        string Department;
        bool isStudent;
    }
     
     //state variable of result
    int256 public result = 22;
    mapping(string=>Person) public NameToCredentials;
    Person[] public StudentScore;
    address public owner;
    mapping(address=>bool) public isAllowed;


    constructor() {
        owner = msg.sender;
        isAllowed[msg.sender] = true;
    }

       //only allows permitted addresses to add and edit scores
    modifier onlyAllowed() {
        require(isAllowed[msg.sender], "NOT ALLOWED");
        _;
    }

    function SaveResult(string memory _Name, 
    int256 _MathsScore, int256 _English,
     string memory _Department,
      bool _isStudent) public onlyAllowed {
     StudentScore.push(Person(_Name, _MathsScore, _English,
     _Department, _isStudent));
     NameToCredentials[_Name] = (Person(_Name, _MathsScore, _English,
     _Department, _isStudent));
    }

    function StoreResult(int256 _result) public {
        result = _result;
    }

    function CheckResult(string memory _Name) public view returns (Person memory){
    return NameToCredentials[_Name];  
    }


    function addAllowed(address _account) public onlyAllowed {
        isAllowed[_account] = true;
    }


    function removeAllowed(address _account) public onlyAllowed {
        isAllowed[_account] = false;
    }

    
    
    }
