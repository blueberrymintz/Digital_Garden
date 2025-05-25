local inputLog = "Function parameter1 parameter2 parameter3 parameter4" 
  local words = {};

  inputLog = inputLog .. " ";
  while(string.len(inputLog) > 0) do 
    local n = string.find(inputLog," ")
    if(n ~= nil)then 
    local newWord = string.sub(inputLog,0,n-1)--Gets from beginning until before space
    table.insert(words,newWord);
    inputLog = string.sub(inputLog,n+1)--Gets from AFTER space till end
    else
      break
     end
   end

   for i=1,#words do 
    print(words[i]);
   end