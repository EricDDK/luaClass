require "luaClass.luaTemplate"
luaTemplate("array",false)
:declObject(number):_size()
:declObject(table):_data()
:declMethod(number):size()
:declMethod(Ty):at(number)
:declMethod(void):push_back(Ty)
:declMethod(void):merge(array)
:declMethod(Ty):pop_back()
:declMethod(bool):empty()
:declMethod(void):clear()
:declMethod(any):reverse()
:declMethod(any,any,any):iter()

function array:array(t)
    t=t or {}
    self._data=t
    self._size=#t
end
function array:at(index)
    return self._data[index]
end
function array:merge(arr)
    local arrsize=arr._size  or #arr
    local size=self._size
    local selfData=self._data 
    local arrData=arr._data or arr
    for i=1,arrsize do
        selfData[size+i]=arrData[i]            
    end
    self._size=size+arrsize
end    

function array:size()
    return self._size
end

function array:push_back(value)
    local num=self._size+1
    self._size=num
    self._data[num]=value
end
function array:pop_back()
    local num=self._size
    local elem=self._data[num]
    self._data[num]=nil
    num=num-1
    self._size=num<0 and 0 or num
    return elem
end
function array:empty()
    return self._size==0
end
function array:iter()
    local data=self._data
    return ipairs(data)
end
function array:clear()
    self._data={}
end
function array:reverse()
    local data={}
    local sourceData=self._data
    local size=self._size
    if size~=0 then
        for i=1,size do
            data[i]=sourceData[size+1-i]
        end
    end
    return array(self.__ty)(data)
end
return array