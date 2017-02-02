//
//  Substring_Concat.java
//  
//
//  Created by Developer on 2/1/17.
//
//THIS IS JAVA CODE

public class Solution {
    public ArrayList<Integer> findSubstring(String a, final List<String> b) {
        
        ArrayList<Integer> solution = new ArrayList<Integer>();
        
        
        HashMap<Integer, ArrayList<Integer>> hash = new HashMap<Integer, ArrayList<Integer>>();
        
        int lengthOfL = b.get(0).length();
        
        for (int i=0; i<a.length(); i++) {
            
            ArrayList<Integer> matchIndex = matchFromArrayToStringAtIndex(b, a, i);
            // System.out.println(match);
            
            if (matchIndex!= null){
                // System.out.println("Hash at index="+i);
                hash.put(i, matchIndex);
            }
        }
        //     // hash testing
        // int value = hash.get(3);
        //     System.out.println("hash Value = "+value);
        
        
        int maxLengthToCheck = a.length() - (b.size()*lengthOfL)+1;
        // System.out.println("max lenth"+maxLengthToCheck);
        //for (int i=0; i<maxLengthToCheck; i++) {
        int i=0;
        while (i<maxLengthToCheck ) {
            // System.out.println("For each letter at i ="+i+"start looking");
            int[] arrayTracker = new int[b.size()];
            int numberOftracked = 0;
            for (int j=i; j<a.length(); j+=lengthOfL) {
                // System.out.println("For each letter at i="+i+"look at j="+j+"to ="+a.length());
                ArrayList<Integer> foundIndexList = hash.containsKey(j) ? hash.get(j) : null; //All in L that appear at j in S
                
                if (foundIndexList != null){
                    // System.out.println("Got hash value Size = "+foundIndexList.size());
                }
                if (foundIndexList != null) {
                    Integer foundIndex = null;
                    for (int k = 0; k<foundIndexList.size(); k++) {
                        Integer foundIndexCandidate = foundIndexList.get(k);
                        if (arrayTracker[foundIndexCandidate] == 0) {
                            arrayTracker[foundIndexCandidate] = 1;
                            foundIndex = foundIndexCandidate;
                            numberOftracked++;
                            // System.out.println("tacked = "+foundIndexCandidate+" numberOftracked = "+numberOftracked);
                            break;
                        }
                    }
                    if (foundIndex == null) {
                        break;
                    }
                    
                    if (numberOftracked == b.size()) {
                        numberOftracked = 0;
                        // System.out.println("add to solution = "+i);
                        solution.add(i);
                        // i = i+j+lengthOfL;
                        break;
                    }
                }
                else {
                    break;
                }
            }
            i++;
        }
        return solution;
    }
    
    
    public ArrayList<Integer> matchFromArrayToStringAtIndex(List<String> array, String longString, int index) {
        
        ArrayList<Integer> arrayOfIndex = new ArrayList<Integer>();
        for (int i=0; i<array.size(); i++) {
            
            String current = array.get(i);
            // System.out.println("current" + current+"\n");
            int x = 0;
            int y = index;
            String solution = "";
            while (x<current.length() && y<longString.length()) {
                char arrayChar = current.charAt(x);
                char longStringChar = longString.charAt(y);
                
                if (arrayChar != longStringChar) {
                    solution = "";
                    break;
                }
                
                x++;
                y++;
            }
            
            if (x == (current.length())) {
                // System.out.println("add" + i);
                arrayOfIndex.add(i);
            }
        }
        
        
        return arrayOfIndex.size()>0 ? arrayOfIndex : null;
    }
    
    
    
}
