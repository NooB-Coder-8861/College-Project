pragma solidity >=0.5.0<0.9.0;                      //setting a long range to avoid any syntactical error


contract Vote{                                      //Smart Contract

    struct Candidate{                               //Structure for candidates
    string name;
    uint voteCount;
    }

Candidate[] public Candidates;                      //Array of Candidates

    struct Voter{                                   //Structure for Voters
        bool voted;
        bool access;
        uint index;
    }

    mapping(address => Voter) public Voters;        //List of Voters

    address public admin;                           //Election Commissioner

    constructor( string[] memory _name) public{
        
        admin = msg.sender;

        for(uint i = 0;i < _name.length; i++){        //Loding the name of Candidate and initialising voteCount as 0
            Candidates.push(Candidate({
                name: _name[i],
                voteCount: 0
            }));
        }
    }
}
