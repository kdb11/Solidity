//SPDX-License-Identifier: MIT
pragma solidity 0.8.8;

contract SimpleStorage {
    int256 bestNum;
    //people public person = people({bestNum: 2, name: "Abdi"});
    mapping(string => int256) public nameToBestNum;

    struct People {
        int256 bestNum;
        string name;
    }

    People[] public people;
    uint256[] public bestNumList;
    
    function newBestNumber(int256 _bestNum) public {
        bestNum = _bestNum;
    }

    // view, pure
    function retrieve() public view returns(int256) {
        return bestNum;
    }

    //calldata, memory, storage
    function addPerson(string memory _name, int256 _bestNum) public {
        People memory newPerson = People({bestNum: _bestNum, name: _name});
        people.push(newPerson);
        nameToBestNum[_name] = _bestNum;
    }
}