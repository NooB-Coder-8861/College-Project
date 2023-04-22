pragma solidity >=0.5.0<0.9.0;                      //setting a long range to avoid any syntactical error
pragma experimental ABIEncoderV2;                   //Without this Showing Error

contract Vote{                                      //Smart Contract

    struct Candidate{                               //Structure for candidates
    string name;
    uint voteCount;
    }

Candidate[] public Candidates;                      //Array of Candidates

    struct Voter{                                   //Structure for Voters
        bool voted;
        bool access;
        uint vote;
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

    function giveAccessToVote(address _voter) public {//giving eligible voters Access to vote
        require(msg.sender == admin,"Only Admin Can Give Access to Vote");
        require(!Voters[_voter].voted,"This address have already voted");
        require(!Voters[_voter].access,"This address already have Access to Vote");

        Voters[_voter].access = true;
    }

    function voting(uint _Candidate) public {           //the Actual Voting happing here
        Voter storage Sender = Voters[msg.sender];
        require(Sender.access,"This address have no Access to Vote");
        require(!Sender.voted,"This address have already Voted");
        Sender.vote = _Candidate;
        Sender.voted = true;
        Sender.vote = _Candidate;

        Candidates[_Candidate].voteCount = Candidates[_Candidate].voteCount + 1;
    }
}
