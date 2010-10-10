
#ifndef __ACT_ARRAY_H__
#define __ACT_ARRAY_H__

//---------------------------------------------------------------------------
// very simple dynamic array
//---------------------------------------------------------------------------
template <class _Tp>
class xarray
{
public:
  xarray();
  xarray(const xarray & src);
  ~xarray();

  bool isEmpty() const      { return m_nSize <= 0; }
  int  size() const         { return m_nSize; }
  int  maxSize() const      { return m_nMaxSize; }
  int  upperBound() const   { return m_nSize-1; }
  void setSize(int nNewSize, int nGrowBy = -1);

  void set(int nIndex, const _Tp & newElement) { m_pData[nIndex] = newElement; }
  void set(int nIndex, const _Tp * newElement) { m_pData[nIndex] = *newElement; }

  const _Tp & at(int nIndex)  const  { return m_pData[nIndex]; }
  _Tp & at(int nIndex)               { return m_pData[nIndex]; }

  const _Tp & first() const { return at(0); }
  _Tp & first()             { return at(0); }

  const _Tp & last() const  { return m_pData[m_nSize-1]; }
  _Tp & last()              { return m_pData[m_nSize-1]; }

  // direct access to the element data (may return NULL)
  const _Tp * getData() const { return (const _Tp*)m_pData; }
        _Tp * getData()       { return (_Tp*)m_pData; }
  operator const _Tp*() const { return getData(); }
  operator _Tp*()             { return getData(); }

  // potentially growing the array
  void setGrow(int nIndex, const _Tp & newElement);
  void setGrow(int nIndex, const _Tp * newElement);
  int add(const _Tp & newElement)
    { int nIndex = m_nSize; setGrow(nIndex, newElement); return nIndex; }

  int add(const _Tp * newElement)
    { int nIndex = m_nSize; setGrow(nIndex, newElement); return nIndex; }

  void copy(const xarray & src);

  // overloaded operator helpers
  xarray & operator=(const xarray & src) { copy(src); return *this; }
  const _Tp & operator[](int nIndex) const { return at(nIndex); }
  _Tp & operator[](int nIndex)             { return at(nIndex); }
  int operator==(const xarray & other) const;

  // operations that move elements around
  void insertAt(int nIndex, const _Tp & newElement, int nCount = 1);
  void insertAt(int nStartIndex, const xarray & newcxarray);
  void remove(int nIndex, int nCount = 1);
  void removeFast(int nIndex);
  void removeAll() { remove(0, size()); }
protected:
	_Tp *   m_pData;     // the actual cxarray of data
	int     m_nSize;     // # of elements (upperBound + 1)
	int     m_nMaxSize;  // max allocated
	int     m_nGrowBy;   // grow amount
};

//---------------------------------------------------------------------------
// xarray<_Tp> out-of-line functions
//---------------------------------------------------------------------------

template<class _Tp>
xarray<_Tp>::xarray()
{
	m_pData = NULL;
	m_nSize = m_nMaxSize = m_nGrowBy = 0;
}

template<class _Tp>
xarray<_Tp>::xarray(const xarray<_Tp> & src)
{
	m_pData = NULL;
	m_nSize = m_nMaxSize = m_nGrowBy = 0;
  copy(src);
}  

template<class _Tp>
xarray<_Tp>::~xarray()
{
	delete[] m_pData;
}

template<class _Tp>
void xarray<_Tp>::setSize(int nNewSize, int nGrowBy)
{
	if (nGrowBy != -1)
		m_nGrowBy = nGrowBy;  // set new size

	if (nNewSize == 0) // shrink to nothing
	{
		if (m_pData != NULL)
		{
      delete[] m_pData;
			m_pData = NULL;
		}
		m_nSize = m_nMaxSize = 0;
	}
  else if (m_pData == NULL) // create one with exact size
	{
    m_pData = new _Tp[nNewSize];
		m_nSize = m_nMaxSize = nNewSize;
	}
	else if (nNewSize <= m_nMaxSize) // it fits
	{
		m_nSize = nNewSize;
	}
	else // otherwise, grow cxarray
	{
		int nGrowBy = m_nGrowBy;
		if (nGrowBy == 0)
		{
			// heuristically determine growth when nGrowBy == 0
			//  (this avoids heap fragmentation in many situations)
			nGrowBy = m_nSize / 8;
      if (nGrowBy < 8)
        nGrowBy = 8;
		}
		int nNewMax;
		if (nNewSize < m_nMaxSize + nGrowBy)
			nNewMax = m_nMaxSize + nGrowBy;  // granularity
		else
			nNewMax = nNewSize;  // no slush

    _Tp * pNewData = new _Tp[nNewMax];
  	memmove(pNewData, m_pData, m_nSize * sizeof(_Tp)); // copy new data from old
    delete[] m_pData;
		m_pData = pNewData;
		m_nSize = nNewSize;
		m_nMaxSize = nNewMax;
	}
}

template<class _Tp>
void xarray<_Tp>::copy(const xarray<_Tp> & src)
{
  if (this != src)
  {
	  setSize(src.m_nSize);
    memmove(m_pData, src.m_pData, src.m_nSize);
  }
}

template<class _Tp>
void xarray<_Tp>::setGrow(int nIndex, const _Tp & newElement)
{
	if (nIndex >= m_nSize)
		setSize(nIndex+1, -1);
	m_pData[nIndex] = newElement;
}

template<class _Tp>
void xarray<_Tp>::setGrow(int nIndex, const _Tp * newElement)
{
	if (nIndex >= m_nSize)
		setSize(nIndex+1, -1);
	m_pData[nIndex] = *newElement;
}

template<class _Tp>
void xarray<_Tp>::insertAt(int nIndex, const _Tp & newElement, int nCount)
{
	int nMoveCount = m_nSize - nIndex;
  setSize(m_nSize + nCount, -1);
  if (nMoveCount > 0)
    memmove(m_pData + (nIndex+nCount), m_pData + nIndex, nMoveCount * sizeof(_Tp));
  for (int i=0; i<nCount; i++)
    m_pData[nIndex+i] = newElement;
}

template<class _Tp>
void xarray<_Tp>::remove(int nIndex, int nCount)
{
	// just remove a range
	int nMoveCount = m_nSize - (nIndex + nCount);
	if (nMoveCount)
		memmove(m_pData + nIndex, m_pData + (nIndex + nCount), nMoveCount * sizeof(_Tp));
	m_nSize -= nCount;
}

template<class _Tp>
void xarray<_Tp>::removeFast(int nIndex)
{
  if (nIndex < m_nSize-1)
    at(nIndex) = at(m_nSize-1);
  m_nSize--;
}

#endif //__ACT_ARRAY_H__
