package p;

public class Child {
		private int age;
		private int height;
		private boolean parent;
		private boolean heartDisease;
		private String[] attractions;

		
		public String toString() {
			String rtn = null;
			
			StringBuilder sb = new StringBuilder();
			for(String attraction : attractions){
				sb.append(attractions); 
				sb.append(",");
			}
			
			rtn = String.format("%s\t%s\t%s\t%s\t", age, height, parent, heartDisease);
			rtn += sb.toString();
			return rtn;
		}
		
		 public Child() { }
		 
		
		public int getAge() {
			return age;
		}

		public void setAge(int age) {
			this.age = age;
		}

		public int getHeight() {
			return height;
		}

		public void setHeight(int height) {
			this.height = height;
		}

		public boolean isParent() {
			return parent;
		}

		public void setParent(boolean parent) {
			this.parent = parent;
		}

		public boolean isHeartDisease() {
			return heartDisease;
		}

		public void setHeartDisease(boolean heartDisease) {
			this.heartDisease = heartDisease;
		}

		public String[] getAttractions() {
			if(this.attractions == null) {
				this.attractions = new String[0];
			}
			
			return attractions;
		}

		public void setAttractions(String[] attractions) {
			this.attractions = attractions;
		}
		
		public String getCanride() {
			
			String qustn1 = "";
			if (this.heartDisease == false) {
				if (this.age >= 6 && this.height >= 120) {
					qustn1 = "탄다";
				} else {
					if (this.height >= 120 && this.parent) {
						qustn1 = "탄다";
					} else {
						qustn1 = "못타";
					}
				}
			} else {
				qustn1 = "못타";
			}
			return qustn1;
		}


}