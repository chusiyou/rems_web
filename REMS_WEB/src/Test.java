
public class Test {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//int temp=11;
		//System.out.println(temp/10);
		
		String name = "G:\\资料\\身份证\\IMG_1422.JPG";
    	
    	if(name.contains("\\")){
    		//如果name 包含\  证明是IE浏览器
    		int lastChar=name.lastIndexOf("\\");
    		String tempStr=name.substring(lastChar+1, name.length());
    		System.out.println("tempStr========="+tempStr);
    	}

	}

}
