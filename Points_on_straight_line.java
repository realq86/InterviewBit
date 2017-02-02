//
//  Points_on_straight_line.java
//  
//
//  Created by Developer on 2/1/17.
//
//THIS IS JAVA CODE

public class Solution {
    public int maxPoints(ArrayList<Integer> xList, ArrayList<Integer> yList) {
        
        HashMap<String, HashMap<Integer, Boolean>> hash = new HashMap< String, HashMap<Integer, Boolean> >();
        
        if (xList.size() < 2) {
            return xList.size();
        }
        
        for (int i=0; i<xList.size(); i++) {
            
            double x1 = xList.get(i);
            double y1 = yList.get(i);
            
            // System.out.println(" " + x1 + " "+y1 + "\n");
            
            for (int j=i+1; j<xList.size(); j++) {
                String hashValue = "";
                double x2 = xList.get(j);
                double y2 = yList.get(j);
                
                double a = 0;
                double b = 0;
                if ((x2-x1) != 0) {
                    a = (y2 - y1) / (x2 - x1);
                    b = y1 - a*x1;
                    hashValue = a + ":" + b;
                }
                else {
                    a = 0;
                    hashValue = "y=" + x1;
                }
                //System.out.println("hash value = "+hashValue + "\n");
                
                //Check for exist in hash
                HashMap points = hash.get(hashValue);
                if (points == null) {
                    points = new HashMap<String, Boolean>();
                }
                
                points.put(i,true);
                //	System.out.println("put "+ x1y1 + "hash size= "+points.size());
                points.put(j,true);
                //System.out.println("put " + x2y2 + "hash size= "+points.size());
                hash.put(hashValue, points);
            }
        }
        
        int max = 0;
        
        for (HashMap points : hash.values()){
            
            int count = points.size();
            
            if (max < count) {
                
                max = count;
            }
        }
        
        return max;   
    }
}
