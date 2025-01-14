using FluentAssertions;
using Pims.Api.Services;
using Pims.Core.Test;
using Pims.Dal.Exceptions;
using Pims.Dal.Security;
using System;
using System.Collections.Generic;
using System.Diagnostics.CodeAnalysis;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Xunit;

namespace Pims.Api.Test.Services
{
    [Trait("category", "unit")]
    [Trait("category", "api")]
    [Trait("area", "expropriation-payments")]
    [ExcludeFromCodeCoverage]
    public class ExpropriationPaymentServiceTest
    {
        private readonly TestHelper _helper;

        public ExpropriationPaymentServiceTest()
        {
            _helper = new TestHelper();
        }

        [Fact]
        public void GetById_NoPermission()
        {
            var service = CreateServiceWithPermissions();

            // Act
            Action act = () => service.GetById(1);

            // Assert
            act.Should().Throw<NotAuthorizedException>();
        }

        private ExpropriationPaymentService CreateServiceWithPermissions(params Permissions[] permissions)
        {
            var user = PrincipalHelper.CreateForPermission(permissions);
            _helper.CreatePimsContext(user, true);
            return _helper.Create<ExpropriationPaymentService>(user);
        }
    }
}
