## snippets

This Project is a collection of my code snippets for personal use, **but anyone can share and use it without any permission**.

## Catalog

### 1. [Shell](./shell)

#### 1. [join](shell/join.sh): Join elements of an array with a charactor in pure bash.

```
join ':' a  b c d => a:b:c:d
join '_' 1 2 3 4 => 1_2_3_4
```

#### 2. [split](shell/split.sh): Split a string into an array using a specied delimiter in pure bash.

```
split.sh ':' Hello:"Hello    World" => array={"Hello", "Hello    World"}
split ',' 1,2,3,4 => array={1,2,3,4}
```

#### 3. [word count](shell/wordCount.sh): Word count implemented in pure bash.

```
./wordCount.sh hello world hello goodbye a a b c a a a
goodbye: 1
a: 5
b: 1
c: 1
hello: 2
world: 1
```

### 2. [C/CPP](./cpp)

### 3. [Golang](./golang)

### 4. [Python](./python)

### 5. [Scala](./scala)

### 6. [Java](./java)
