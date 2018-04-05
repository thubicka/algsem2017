package cz.thu.hashing;

import java.util.LinkedList;

public class HashingWithOpenAddressing {
	// declare hashtable, size is prime number - see
	// https://primes.utm.edu/lists/
	final int HASHSIZE = 2203;

	StoredObject[] HASHTABLE = new StoredObject[HASHSIZE];

	public HashingWithOpenAddressing() {
		// intialize hashtable to be empty
		for (int i = 0; i < HASHSIZE; i++) {
			HASHTABLE[i] = null;
		}
	}

	public int hashFunction(int a_key, int a_try) {
		int h1 = a_key % HASHSIZE;
		int h2 = 1 + (a_key % (HASHSIZE - 1));

		return (h1 + a_try * h2) % HASHSIZE;
	}

	public int insert(StoredObject a_object) {

		int i = 0;
		boolean found = false;

		do {
			int h = hashFunction(a_object.getObjectKey(), i);
			if (HASHTABLE[h] == null) {
				HASHTABLE[h] = a_object;
				found = true;
				System.out.printf("Found empty space [%d] for key [%d]\n", h, a_object.getObjectKey());
			} else {

				i++;
				System.out.printf("Another try [%d] for value [%d]\n", i, a_object.getObjectKey());
			}
		} while ((i != HASHSIZE) && (!found));

		if (!found) {
			System.out.printf("Not found empty space for value [%d]\n", a_object.getObjectKey());
		}

		return i;
	}

	public int numOfEmptyBuckets() {
		int numOfEmpty = 0;

		for (int i = 0; i < HASHSIZE; i++) {
			if (HASHTABLE[i] == null)
				numOfEmpty++;
		}
		return numOfEmpty;
	}

	public static void main(String[] args) {

		int maxTries = 0;

		int SZ = 1000;
		StoredObject[] OBJS = new StoredObject[SZ];

		for (int i = 0; i < SZ; i++) {
			OBJS[i] = new StoredObject((int) (Math.random() * 1000000000));
		}

		System.out.println("Starting...");

		HashingWithOpenAddressing hashtable = new HashingWithOpenAddressing();

		for (int i = 0; i < OBJS.length; i++) {
			int t = hashtable.insert(OBJS[i]);
			if (t > maxTries)
				maxTries = t;
		}

		System.out.println("Finished...");

		System.out.printf("Number of empty posistions: [%d]\n", hashtable.numOfEmptyBuckets());
		System.out.printf("Max number of tries: [%d]\n", maxTries);
	}

}
