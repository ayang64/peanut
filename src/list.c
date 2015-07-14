
#include "list.h"
#include "xmalloc.h"

void *
list_pop(struct node **head)
{
	if (*head == NULL)
		return NULL;
	struct node *next = (*head)->next;
	void *rc = (*head)->data;
	xfree(*head);
	*head = next;
	return rc;
}

struct node *
list_free(struct node *head, void (*freefunc)(void *))
{
	while (head != NULL)
		freefunc(list_pop(&head));

	return NULL;
}

struct node *
list_push(struct node **head, void *d)
{
	struct node *rc = xmalloc(sizeof (*rc));

	rc->data = d;
	rc->next = *head;
	*head = rc;

	return *head;
}

