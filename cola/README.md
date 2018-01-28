## Double Cola

https://www.codewars.com/kata/551dd1f424b7a4cdae0001f0

Sheldon, Leonard, Penny, Rajesh and Howard are in the queue for a "Double Cola" drink vending machine; there are no other people in the queue. The first one in the queue (Sheldon) buys a can, drinks it and doubles! The resulting two Sheldons go to the end of the queue. Then the next in the queue (Leonard) buys a can, drinks it and gets to the end of the queue as two Leonards, and so on.

For example, Penny drinks the third can of cola and the queue will look like this:

```
Rajesh, Howard, Sheldon, Sheldon, Leonard, Leonard, Penny, Penny
```

Write a program that will return the name of the person who will drink the n-th cola.

Note that in the very beginning the queue looks like that:

Sheldon, Leonard, Penny, Rajesh, Howard

## Input

The input data consist of an array which contains at least 1 name, and single integer n.
```
(1 ≤ n ≤ 1000000000).
```

## Output / Examples

Return the single line — the name of the person who drinks the n-th can of cola. The cans are numbered starting from 1. Please note that you should spell the names like this: "Sheldon", "Leonard", "Penny", "Rajesh", "Howard" (without the quotes). In that order precisely the friends are in the queue initially.

```
whoIsNext(["Sheldon", "Leonard", "Penny", "Rajesh", "Howard"], 1)=="Sheldon"
whoIsNext(["Sheldon", "Leonard", "Penny", "Rajesh", "Howard"], 52)=="Penny"
whoIsNext(["Sheldon", "Leonard", "Penny", "Rajesh", "Howard"], 7230702951)=="Leonard"
```

## Personal notes

- Obvious that the array shouldn't be built
- `SLPRH SS LL PP RR HH SSSS LLLL PPPP RRRR HHHH SSSSSSSS LLLLLLLL PPPPPPPP ...`: 5 then 10 then 20 then 40...
- `LLLL PPPP RRRR HHHH`: state reached at the 5 + 10 iterations
- `SSSSSSSS LLLLLLLL PPPPPPPP RRRRRRRR HHHHHHHH` state reached at the 5 + 10 + 20 iterations
- `SSSSSSSSSSSSSSSS LLLLLLLLLLLLLLLL PPPPPPPPPPPPPPPP RRRRRRRRRRRRRRRR HHHHHHHHHHHHHHHH` state reached at the 5 + 10 + 20 + 40 iterations
- 40 = 5 * 2^3
- 35 = 5 * 2^0 + 5 * 2^1 + 5 * 2^2 = 5 * (2^0 + 2^1 + 2^2) `(0..2).map{|x| 2 ** x}.sum * 5`
- 75 = 5 * (1 + 2^1 + 2^2 + 2^3) `(0..3).map{|x| 2 ** x}.sum * 5`
- 35 < 52 < 75
- 53 - 35 = 17
- 17.0 / 2^3 = 2.12 => "Penny"

Position is: 7230702951
```
(0..30).map{ |x| 2 ** x }.sum * 5 #=> 10737418235
(0..29).map{ |x| 2 ** x }.sum * 5 #=> 5368709115
7230702951 - 10737418235 #=> -3506715284
7230702951 - 5368709115 #=> 1861993836
1861993836.0 / 2**30 #=> 1.734116893261671
```
=> Leonard

