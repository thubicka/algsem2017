package cz.thu.hashing;

public class StoredObject {
	private int objectKey;
	private Object value;

	public StoredObject(int a_key) {
		setObjectKey(a_key);
	}

	@Override
	public boolean equals(Object obj) {

		return ((StoredObject) obj).getObjectKey() == this.getObjectKey();
	}

	public int getObjectKey() {
		return objectKey;
	}

	public void setObjectKey(int objectKey) {
		this.objectKey = objectKey;
	}

	public Object getValue() {
		return value;
	}

	public void setValue(Object value) {
		this.value = value;
	}

}