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

#### 4. [getopts example](shell/getopts.sh): getopts usage example.

```bash
#while getopts 'u:p:h' OPT # don't supress error, prints an error message and unset OPTARG.
while getopts ':u:p:h' OPT # supress error
do
    case $OPT in
        u)
            echo "parse '-u' option: value=${OPTARG} index=${OPTIND}"
            ;;
        p)
            echo "parse '-p' option: value=${OPTARG} index=${OPTIND}"
            ;;
        h)
            echo "parse '-h' option: value=${OPTARG} index=${OPTIND}"
            ;;
        ?)
            echo "Invalid option at ${OPTIND}"
            ;;
    esac
done
```

### 2. [C/CPP](./cpp)

### 3. [Golang](./golang)

### 4. [Python](./python)

#### 1. [subprocess](python/test_subprocess.py): Call system command using subprocess module.

```python
def _check_service_name_by_port(port, name):
        p1 = Popen(['lsof', '-i:%s' % port, '-Fc'], stdout=PIPE)
        p2 = Popen(["grep", '-Pic', 'c' + name], stdin=p1.stdout, stdout=PIPE)
        output = p2.communicate()[0]
        return int(output) > 0
```

#### 2. port scanner: Port scanner in Python.

```python
#!/usr/bin/env python
from socket import *
targetIP = gethostbyname(hostname)
s = socket(AF_INET, SOCK_STREAM)
result = s.connect_ex((targetIP, port))
if(result == 0) :
    print 'Port %d: OPEN' % (i,)
s.close()
```

#### 3. database query

```python

def query_db(logger, connection_string, query_string):
    try:
        engine = sqlalchemy.create_engine(connection_string)
        res = engine.execute(query_string).first()
    except sqlalchemy.exc.OperationalError as e:
        logger.critical("Operational error '%s'" % e)
    except sqlalchemy.exc.ProgrammingError as e:
        logger.critical("Programming error '%s'" % e)
    else:
        return res[0]
```

### 5. [Scala](./scala)

### 6. [Java](./java)


### 7. [Pacemaker]

```
pcs resource cleanup xxx-server
pcs resource restart xxx-server
pcs resource enable xxx-server
```
