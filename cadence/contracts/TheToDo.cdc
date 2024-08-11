access(all)
contract TheToDo {

    access(all)
    struct List {
        pub(set) var id: UInt32
        pub(set) var title: String
        pub(set) var is_done: Bool

        init(_ id: UInt32, _ title: String, _ is_done: Bool) {
            self.id = id
            self.title = title
            self.is_done = is_done
        }
    }

    access(all)
    let lists: {Address: {UInt32: List}}

    init() {
        self.lists = {}
    }

    access(all)
    fun createList(owner:Address, _ title: String) {
        
        let userLists:{UInt32: TheToDo.List} = self.lists[owner] ?? {}

        let newID = UInt32(userLists.length + 1)
        let newList = List(newID, title, false)
        
        userLists[newID] = newList
        self.lists[owner] = userLists
    }

    access(all)
    fun markListDone(owner:Address,_ id: UInt32) {
        let userLists = self.lists[owner] ?? panic("No lists found for this user")

        var list     = userLists[id] ?? panic("List not found")
        userLists[id].isDone = true

        userLists[id] = list
        self.lists[owner] = userList    
    }

    access(all)
    fun getListItem(owner: Address,_ id: UInt32): List? {
        let userLists = self.lists[owner]
        return userLists[id]
    }

    access(all)
    fun getList(_ id: UInt32, _ owner: Address): {UInt32: List}? {
        return self.lists[owner]
    }
}
