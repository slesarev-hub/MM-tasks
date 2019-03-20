#include <Windows.h>
#include <iostream>
#include <vector>
#include <ctime>

using namespace std;

#define M 6

//auxiliary structure
struct Point
{
	double x;
	double y;
	Point(double x1, double y1)
	{
		x = x1;
		y = y1;
	}
};

//main structure
struct Object : Point
{
	double radius;
	bool node;
	double distance_to_parent;
	Object *parent;
	vector<Object*> covering_tree;

	Object(double x, double y, double r = 0., bool n = false, double d = 0., Object *p = NULL, vector<Object*> t = {}) :Point(x, y)
	{
		radius = r;
		node = n; //0 if object hasn't children or object stores objects which haven't children  
		distance_to_parent = d;
		parent = p;
		covering_tree = t;
	}
};

//metric
double distance(Object *A, Object *B)
{
	return sqrt((A->x - B->x)*(A->x - B->x) + (A->y - B->y)*(A->y - B->y));
}

//the sum of ind_1 & ind_2 radiuses in N where ind_1 & ind_2 are indexes of objects
double rad_sum(Object *N, int ind_1, int ind_2)
{
	return N->covering_tree[ind_1]->radius + N->covering_tree[ind_2]->radius;
}

void MTreePrint(Object *N,/*service argument*/ int deepth)
{
	int i;

	for (i = 0; i < deepth; i++)
		cout << " ";

	cout << "(" << N->x << "," << N->y << ") distant_to_parent : " << N->distance_to_parent << " ";

	if (N->radius != 0)
		cout << "radius : " << N->radius << " ";

	if (N->parent != NULL)
		cout << "parent : (" << N->parent->x << "," << N->parent->y << ") ";

	cout << "node : " << N->node << " ";

	if (N->covering_tree.size() != 0)
	{
		cout << "size : " << N->covering_tree.size() << endl;
		for (i = 0; i < (int)N->covering_tree.size(); i++)
		{
			MTreePrint(N->covering_tree[i], deepth + 1);
			cout << "\n";
		}
	}
}

//draw circle in console
void circle(Object *N, bool if_searching_object = false)
{
	HWND hWnd = GetConsoleWindow();
	HDC hDC = GetDC(hWnd);
	double point_size = 2.5;

	if (N->parent == NULL)
		SelectObject(hDC, CreatePen(1, 3, RGB(255, 0, 0)));
	else if (N->node)
		SelectObject(hDC, CreatePen(1, 3, RGB(0, 255, 0)));
	else
		SelectObject(hDC, CreatePen(1, 3, RGB(255, 255, 255)));
	if (if_searching_object)
		SelectObject(hDC, CreatePen(1, 3, RGB(60, 70, 255)));

	Arc(hDC, N->x - point_size, N->y + point_size, N->x + point_size, N->y - point_size, N->x, N->y + point_size, N->x, N->y + point_size);
	Arc(hDC, N->x - N->radius, N->y + N->radius, N->x + N->radius, N->y - N->radius, N->x, N->y + N->radius, N->x, N->y + N->radius);

	ReleaseDC(hWnd, hDC);
}

void MTreeDraw(Object *N)
{
	int i;

	circle(N);
	for (i = 0; i < (int)N->covering_tree.size(); i++)
	{
		MTreeDraw(N->covering_tree[i]);
	}
}

//Put object in certain node N & stretch N's radius
void store(Object *adding, Object *N)
{
	//cout << "store (" << adding->x << "," << adding->y << ") -> (" << N->x << "," << N->y << ")" << endl;

	Object *N_ref = N;

	adding->distance_to_parent = distance(adding, N);
	adding->parent = N;

	if (N->radius <= adding->distance_to_parent + adding->radius)
		N->radius = max(N->radius, adding->distance_to_parent + adding->radius) + 0.1;

	if (adding->covering_tree.size() != 0)
		N->node = true;

	N->covering_tree.push_back(adding);

	//stretch all parent objects radiuses
	while (N_ref->parent != NULL)
	{
		if (N_ref->distance_to_parent + N_ref->radius >= N_ref->parent->radius)
			N_ref->parent->radius = max(N_ref->parent->radius, N_ref->distance_to_parent + N_ref->radius);
		N_ref = N_ref->parent;
	}
}

//choose 2 new nodes
pair<Object *, Object *> SplitPromote(Object *N)
{
	/*m_RAD*/
	int i, j;
	double m_rad = rad_sum(N, 0, 1);
	int ind_p1 = 0;
	int ind_p2 = 1;

	for (i = 0; i < (int)N->covering_tree.size() - 1; i++)
	{
		for (j = i + 1; j < (int)N->covering_tree.size(); j++)
		{
			double new_sum = rad_sum(N, i, j);
			if (new_sum > m_rad)
			{
				ind_p1 = i;
				ind_p2 = j;
				m_rad = new_sum;
			}
		}
	}
	return make_pair(N->covering_tree[ind_p1], N->covering_tree[ind_p2]);
}

//put all obkects from old node to 2 new nodes
pair<Object *, Object *> SplitPartition(pair<Object *, Object *> promoted, Object * N)
{
	//cout << "promoted (" << promoted.first->x << "," << promoted.first->y << ") , (" << promoted.second->x << "," << promoted.second->y << ") (" << N->x << "," << N->y << ")" << endl;

	/*Generalized Hyperplane*/
	int i;
	int s = N->covering_tree.size();
	Object *current = NULL;

	N->node = true;
	promoted.first->parent = N;
	promoted.second->parent = N;
	for (i = 0; i < s; i++)
	{
		current = N->covering_tree.back();
		N->covering_tree.pop_back();

		if ((current == promoted.first) || (current == promoted.second))
			continue;

		if (distance(promoted.first, current) > distance(promoted.second, current))
			store(current, promoted.second);
		else
			store(current, promoted.first);
	}
	return promoted;
}

//Replace one object with anoter in node N
void SplitReplace(Object *replacing, Object *substitute, Object *N)
{
	//cout << "replace (" << replacing->x << "," << replacing->y << ") -> (" << substitute->x << "," << substitute->y << ") (" << N->x << "," << N->y << ")" << endl;

	int i;

	for (i = 0; i < (int)N->covering_tree.size(); i++)
	{
		if (replacing == N->covering_tree[i])
		{
			N->covering_tree.erase(N->covering_tree.begin() + i);
			swap(substitute->node, replacing->node);
			store(substitute, N);
			store(replacing, N->covering_tree[N->covering_tree.size() - 1]);
			break;
		}
	}
}

void MTreeSplit(Object *O, Object *N)
{
	//cout << "split (" << O->x << "," << O->y << ") -> (" << N->x << "," << N->y << ")" << endl;

	N->covering_tree.push_back(O);
	pair<Object *, Object *> promoted = SplitPromote(N);
	pair<Object *, Object *> partitioned = SplitPartition(promoted, N);
	if (N->parent == NULL)
	{
		store(partitioned.first, N);
		store(partitioned.second, N);
		N->node = true;
	}
	else
	{
		SplitReplace(N, partitioned.first, N->parent);

		if (N->parent->covering_tree.size() == M)
		{
			/* NOTHING INTERESTING
			cout << "!!! " << partitioned.first->covering_tree.size() << " "
			<< partitioned.second->covering_tree.size() << " "
			<< N->covering_tree.size() << " "
			<< N->parent->covering_tree.size() << endl;
			cout << "N : (" << N->x << "," << N->y << ") N_parent("
			<< N->parent->x << "," << N->parent->Y << ") N_parent_parent ("
			<< N->parent->parent->x << "," << N->parent->parent->y << ")"
			<< endl;
			*/
			MTreeSplit(partitioned.second, N->parent->parent);
		}
		else
			store(partitioned.second, N->parent);
	}
}

void MTreeInsert(Object *O, Object *N)
{
	//cout << "insert (" << O->x << "," << O->y << ") -> (" << N->x << "," << N->y << ")" << endl;

	if ((N->node) && (N->covering_tree.size() != 0))
	{
		double min_d = -1;
		int om_ind, i;
		for (i = 0; i < (int)N->covering_tree.size(); i++)
		{
			double io_d = distance(N->covering_tree[i], O);
			if ((io_d <= N->covering_tree[i]->radius) && ((min_d == -1) || (io_d < min_d)))
			{
				min_d = io_d;
				om_ind = i;
			}
		}
		if (min_d == -1)
		{
			for (i = 0; i < (int)N->covering_tree.size(); i++)
			{
				double radius1 = distance(N->covering_tree[i], O) - N->covering_tree[i]->radius;
				if ((min_d == -1) || (radius1 < min_d))
				{
					min_d = radius1;
					om_ind = i;
				}
			}
			N->covering_tree[om_ind]->radius = min_d + 0.1;
		}
		MTreeInsert(O, N->covering_tree[om_ind]);
	}
	else if (N->covering_tree.size() < M)
		store(O, N);
	else
		MTreeSplit(O, N);
}

void search(Object *Q, Object *N, double d, vector<Object *> *result)
{
	int i;
	double nq_distance = (d == -1) ? nq_distance = distance(N, Q) : nq_distance = d;
	double new_nq_distance = -1.;

	if (N->covering_tree.size() != 0)
	{
		if (nq_distance <= Q->radius) result->push_back(N);
		for (i = 0; i < (int)N->covering_tree.size(); i++)
			if (abs(nq_distance - N->covering_tree[i]->distance_to_parent) <= Q->radius + N->covering_tree[i]->radius)
			{
				new_nq_distance = distance(Q, N->covering_tree[i]);
				if (new_nq_distance <= Q->radius + N->covering_tree[i]->radius)
					search(Q, N->covering_tree[i], new_nq_distance, result);
			}
	}
	else
	{
		new_nq_distance = distance(Q, N);
		if (new_nq_distance <= Q->radius)
			result->push_back(N);
	}
}

vector<Object *> *MTreeRangeSearch(Object *Q, Object *N)
{
	vector<Object *> *result = new vector<Object *>;
	search(Q, N, -1, result);
	return result;
}

int main()
{
	int i;
	//count of points
	int points = 20;
	Object *root = new Object(260., 260., false, 0., 0., NULL, {});
	Object *Q = new Object(265., 265., 100.);
	vector<double> a = { 463., 276., 321., 282., 298., 416., 411., 239., 366., 243., 268., 293., 303., 397., 375., 467., 367., 349., 309., 370. };

	//generate random points
	srand((unsigned int)time(0));

	a.clear();
	for (i = 0; i < 2 * points; i++)
	{
		a.push_back(rand() % 250 + 230);
	}

	cout << "objects at all : " << points << endl;
	for (i = 0; i < 2 * points - 1; i += 2)
		cout << "(" << a[i] << "," << a[i + 1] << ") ";
	cout << endl;

	for (i = 0; i < 2 * points; i += 2)
		MTreeInsert(new Object(a[i], a[i + 1]), root);

	cout << "MTree : " << endl;
	//print tree nodes
	//MTreePrint(root, 0);

	cout << "searching object : (" << Q->x << "," << Q->y << ") radius : " << Q->radius << endl;
	cout << "range search : " << endl;
	for (auto t : *MTreeRangeSearch(Q, root))
		cout << "(" << t->x << "," << t->y << ") ";
	//draw tree in console
	system("cls");
	MTreeDraw(root);
	circle(Q, 1);
	system("pause");
	return 0;
}