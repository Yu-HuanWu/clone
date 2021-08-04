def stair(n)
    step=[]
    i=0
    j=0
    while j < n/2
        if (i*1 + j*2) == n
            temp=[]
            i.times do
                temp<< 1
            end
            j.times do
                temp<< 2
            end
            step<< temp
            i=0
            j+=1
        end
        i+=1
    end
    step
end

def climb_stairs(n)
    b=1
    a= b
    n.times do
        p "old #{a}"
        p "old #{b}"
        a, b = b, a+b
        p "new #{a}"
        p "new #{b}"
    end
    a
end
climb_stairs(4)