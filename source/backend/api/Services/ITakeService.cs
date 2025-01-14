using System.Collections.Generic;
using Pims.Dal.Entities;

namespace Pims.Api.Services
{
    public interface ITakeService
    {
        IEnumerable<PimsTake> GetByFileId(long fileId);

        IEnumerable<PimsTake> GetByPropertyId(long fileId, long acquisitionFilePropertyId);

        int GetCountByPropertyId(long propertyId);

        IEnumerable<PimsTake> UpdateAcquisitionPropertyTakes(long acquisitionFilePropertyId, IEnumerable<PimsTake> takes);
    }
}
