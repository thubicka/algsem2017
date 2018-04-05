package cz.thu.hashing;

import java.util.LinkedList;

public class HashingWithChaining {

	// declare hashtable, size is prime number - see
	// https://primes.utm.edu/lists/
	final int HASHSIZE = 383;

	LinkedList<StoredObject>[] HASHTABLE = new LinkedList[HASHSIZE];

	public HashingWithChaining() {
		// intialize hashtable to be empty
		for (int i = 0; i < HASHSIZE; i++) {
			HASHTABLE[i] = new LinkedList<StoredObject>();
		}
	}

	public int hashFunction(int a_key) {
		return a_key % HASHSIZE;
	}

	public void insert(StoredObject a_object) {
		int h = hashFunction(a_object.getObjectKey());

		LinkedList<StoredObject> list = HASHTABLE[h];

		if (!list.contains(a_object)) {
			list.add(a_object);
			System.out.printf("Adding [%d] into list [%d], listsize [%d]\n", a_object.getObjectKey(), h,list.size());
		} else {
			System.out.printf("Key [%d] already exists in hashtable.\n", a_object.getObjectKey());
		}
	}

	public int findMaximalListSize() {
		int maxSz = 0;

		for (int i = 0; i < HASHSIZE; i++) {
			if (HASHTABLE[i].size() > maxSz)
				maxSz = HASHTABLE[i].size();
		}
		return maxSz;
	}

	public int numOfEmptyBuckets() {
		int numOfEmpty = 0;

		for (int i = 0; i < HASHSIZE; i++) {
			if (HASHTABLE[i].isEmpty())
				numOfEmpty++;
		}
		return numOfEmpty;
	}

	public static void main(String[] args) {

		int SZ = 1000;
		StoredObject[] OBJS = new StoredObject[SZ];

		for (int i = 0; i < SZ; i++) {
			OBJS[i] = new StoredObject((int) (Math.random() * 1000000000));
		}

		System.out.println("Starting...");

		HashingWithChaining hashtable = new HashingWithChaining();

		for (int i = 0; i < OBJS.length; i++) {
			hashtable.insert(OBJS[i]);
		}

		System.out.println("Finished...");

		System.out.printf("Maximal list size: [%d]\n", hashtable.findMaximalListSize());
		System.out.printf("Number of empty posistions: [%d]\n", hashtable.numOfEmptyBuckets());
	}

}
