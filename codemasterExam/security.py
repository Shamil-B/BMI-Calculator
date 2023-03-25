class Solution:
    def traverse(self,src,dst,graph):
        self.shortest = float("inf")
        def traverseIt(src,dst,path=0,visited = None):
            if src == dst:
                self.shortest = min(self.shortest,path)
                return
            
            if not visited:
                visited = set()

            if src in visited:
                return
            
            visited.add(src)
            path+=1
            for key in graph[src]:
                traverseIt(key,dst,path,visited)

            
            visited.remove(src)

        traverseIt(src,dst)
        return self.shortest
    


secCode = input()
keyPad = input()

graph = {keyPad[0]:[keyPad[1],keyPad[3],keyPad[4]],
         keyPad[1]:[keyPad[0],keyPad[2],keyPad[3],keyPad[4],keyPad[5]],
         keyPad[2]:[keyPad[1],keyPad[4],keyPad[5]],
         keyPad[3]:[keyPad[0],keyPad[1],keyPad[4],keyPad[6]],
         keyPad[4]:[keyPad[0],keyPad[1],keyPad[2],keyPad[3],keyPad[4],keyPad[5],keyPad[6],keyPad[7],keyPad[8]],
         keyPad[5]:[keyPad[1],keyPad[2],keyPad[4],keyPad[7],keyPad[8]],
         keyPad[6]:[keyPad[3],keyPad[4],keyPad[7]],
         keyPad[7]:[keyPad[3],keyPad[4],keyPad[5],keyPad[6],keyPad[8]],
         keyPad[8]:[keyPad[4],keyPad[5],keyPad[7]]}

time = 0
prev = secCode[0]
for i in range(len(secCode)):
    s = Solution()
    res = s.traverse(prev,secCode[i],graph)
    time += res
    prev = secCode[i]

print(time)
