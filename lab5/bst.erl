-module(bst).
-compile(export_all).
-record(node, {value = null, left = null, right = null}).

insert(null, Value) -> 
    #node{value=Value,left=null,right=null};

insert(#node{value=Value,left=Left,right=Right},NewValue)  when NewValue < Value ->
    #node{value=Value,left=insert(Left,NewValue),right=Right};

insert(#node{value=Value,left=Left,right=Right},NewValue)  when NewValue >= Value ->
    #node{value=Value,left=Left,right=insert(Right,NewValue)}.


randBST(0) -> null;
randBST(Length) -> insert(randBST(Length-1),rand:uniform(100)).

bstFromList([])->null;
bstFromList([H|T]) -> 
    bstFromList(T,insert(null,H)).

bstFromList([],Tree) -> Tree;
bstFromList([H|T],Tree) -> insert(bstFromList(T,Tree),H).


bstToList(null) -> [];
bstToList(Tree) -> bstToList(Tree#node.left) ++ [Tree#node.value] ++ bstToList(Tree#node.right).

search(null,_)->false;
search(Tree,Value) when Tree#node.value == Value -> true;
search(Tree,Value) when Tree#node.value < Value -> search(Tree#node.right,Value);
search(Tree,Value) when Tree#node.value > Value -> search(Tree#node.left,Value).