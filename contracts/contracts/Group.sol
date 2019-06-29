pragma solidity ^0.4.18;

//contract Group is Ownable {
contract Group{

    struct Group {
        address add;//分组地址
        uint id;//分组编号
    }
 
    address[] GroupList;//分组的地址列表
    mapping(address => Group) public Groups;//地址到分组情况的映射

    event NewFund(
        uint balance
    );

    //分组是否存在
    modifier groupExit(address groupadd) {
        var group = Groups[groupadd];//
        assert(group.id != 0x0);
        _;
    }

    //查询分组情况
    function checkGroup(uint index) returns (address groupadd, uint groupID) {
        groupadd = GroupList[index];
        var group = Groups[groupadd];//
        groupID = group.id;
    }

    //添加分组
    function addGroup(address groupadd, uint id){
        var group = Groups[groupadd];//
        assert(group.add == 0x0);//检查分组是否存在

        Groups[groupadd] =  Group(groupadd, id);
        GroupList.push(groupadd);
        //NewEmployee(employeeId);//触发事件
    }

    function checkGroupInfo() returns (uint balance, uint GroupCount) {
        balance = this.balance;
        GroupCount = GroupList.length;
    }

    function addGroupFund() payable returns (uint) {
        NewFund(this.balance);
        return this.balance;
    }
}
